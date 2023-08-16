// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T ? data;
  final DioError ? error;
   const DataState({
    this.data,
    this.error,
  });
  
}
class DataSucess<T> extends DataState<T>{
  const DataSucess(T data) :super(data: data);

}
 class DataFaild<T> extends DataState<T>{
  const DataFaild(DioError error) :super (error: error);
 }
 
