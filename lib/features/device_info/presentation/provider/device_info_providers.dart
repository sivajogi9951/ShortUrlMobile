import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/error/exceptions.dart';
import 'package:short_url/core/providers/common_providers.dart';
import 'package:short_url/features/device_info/data/repo_impl/device_info_repo_impl.dart';
import 'package:short_url/features/device_info/data/source/device_info_remote_datasource.dart';
import 'package:short_url/features/device_info/domain/entity/device_info_entity.dart';
import 'package:short_url/features/device_info/domain/repo/device_info_repo.dart';
import 'package:short_url/features/device_info/domain/usecases/get_device_info_usecase.dart';

//Repository
final deviceInfoRepoProvider = Provider<DeviceInfoRepo>((ref) {

  final connectivityService = ref.watch(connectivityProvider);

  final remote = DeviceInfoRemoteDataSourceImpl(
    connectivityService: connectivityService,
  );

 return DeviceInfoRepoImpl(remote: remote);
});

//UseCases
final getDeviceInfoUseCaseProvider = Provider<GetDeviceInfoUseCase>((ref) {
  return GetDeviceInfoUseCase(repo:ref.watch(deviceInfoRepoProvider));
});

final getDeviceInfoProvider = FutureProvider<DeviceInfoEntity>((ref) async {
  final result = await ref.watch(getDeviceInfoUseCaseProvider).call();
  return result.fold(
        (failure){
          // print("RK => ${failure.message}");
          throw ServerException(failure.message);
        },
        (deviceInfo) async{
          await ref.read(sharedPrefsProvider).saveDeviceId(deviceInfo.fingerprint);
          return deviceInfo;
        }
  );
});