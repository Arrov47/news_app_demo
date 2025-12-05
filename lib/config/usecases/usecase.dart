abstract class Usecase <R,P>{
  Future<R> call(P p);
}