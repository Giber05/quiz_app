import 'package:com_bahaso_gilang_liberty/infrastructure/types/mapper/json_mapper.dart';

abstract class LocalMapper<Domain, Entity> {
  LocalMapper();

  Domain toDomain(Entity entity);

  Entity toEntity(Domain domain);
}
