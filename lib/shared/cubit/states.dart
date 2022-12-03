abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class NewsBottomNavlState extends NewsStates{}
class NewsGetBusinessSucessState extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  late final String? error;
  NewsGetBusinessErrorState({this.error});
}
class NewsGetSportsSucessState extends NewsStates{}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  late final String? error;
  NewsGetSportsErrorState({this.error});
}
class NewsGetScienceSucessState extends NewsStates{}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  late final String? error;
  NewsGetScienceErrorState({this.error});
}