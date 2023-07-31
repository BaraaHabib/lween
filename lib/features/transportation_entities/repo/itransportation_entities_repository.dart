import 'package:dartz/dartz.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/features/entities/shared/authenticate.dart';
import 'package:lween/core/features/repo/irepository.dart';
import 'package:lween/features/auth/params/login_params.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/params/follow_entity_params.dart';
import 'package:lween/features/transportation_entities/params/transportation_entities_params.dart';

abstract class ICompaniesRepository extends IRepository {
  Future<Either<ErrorEntity, CompaniesEntity>> getCompanies(GetCompaniesParams model);
  Future<Either<ErrorEntity, EmptyEntity>> toggleFollowCompany(ToggleFollowCompanyParams model);

}
