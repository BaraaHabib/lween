import 'package:dartz/dartz.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/params/follow_entity_params.dart';
import 'package:lween/features/transportation_entities/params/transportation_entities_params.dart';
import 'package:lween/features/transportation_entities/repo/itransportation_entities_repository.dart';
import '../../../../core/exceptions/app_exceptions.dart';

class CompaniesRepository extends ICompaniesRepository {
  RemoteDataSource remoteDataSource;

  CompaniesRepository(this.remoteDataSource);

  
  /// saved companies
  static List<CompanyEntity> companies = <CompanyEntity>[];
  
  @override
  Future<Either<ErrorEntity, CompaniesEntity>> getCompanies(GetCompaniesParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<CompaniesEntity>.fromJson(res,parser: CompaniesEntity.fromJson,);

      /// store companies when fetching all of them
      if(model.isFollowed == null) {
        companies = data.content?.items ?? [];
      }
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
  @override
  Future<Either<ErrorEntity, EmptyEntity>> toggleFollowCompany(ToggleFollowCompanyParams model) async {
    try {
      var res = await remoteDataSource.getRemoteData(model,);
      final data = Entity<EmptyEntity>.fromJson(res,parser: EmptyEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }

}
