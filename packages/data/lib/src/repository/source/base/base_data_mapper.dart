/// 数据映射基类，用于在两种类型之间进行数据映射：R（来自仓库/网络的数据）和 E（应用程序领域中的实体）。
abstract class BaseDataMapper<R, E> {
  const BaseDataMapper();

  /// 将原始数据（R）映射为应用程序实体（E）。
  E mapToEntity(R? data);

  /// 将原始数据列表（List<R>）映射为应用程序实体列表（List<E>）。
  List<E> mapToListEntity(List<R>? listData) {
    return listData?.map(mapToEntity).toList() ?? List.empty();
  }
}

/// Optional: if need map from entity to data
mixin DataMapperMixin<R, E> on BaseDataMapper<R, E> {
  /// 将应用程序实体（E）映射为原始数据（R）。
  R mapToData(E entity);

  /// 将可空应用程序实体（E？）映射为可空原始数据（R？）。
  R? mapToNullableData(E? entity) {
    if (entity == null) {
      return null;
    }

    return mapToData(entity);
  }

  /// 将可空应用程序实体列表（List<E>?）映射为可空原始数据列表（List<R>?）。
  List<R>? mapToNullableListData(List<E>? listEntity) {
    return listEntity?.map(mapToData).toList();
  }

  /// 将应用程序实体列表（List<E>?）映射为原始数据列表（List<R>）。
  List<R> mapToListData(List<E>? listEntity) {
    return mapToNullableListData(listEntity) ?? List.empty();
  }
}
