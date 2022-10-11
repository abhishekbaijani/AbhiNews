import '../models/categories_model.dart';

List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = <CategorieModel>[];
  CategorieModel categorieModel;

  //1
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Business";
  categorieModel.imageAssetUrl = "https://s40424.pcdn.co/in/wp-content/uploads/2022/04/March_What-is-the-Importance-of-Marketing-for-Businesses-1-1140x800.jpg";
  myCategories.add(categorieModel);

  //2
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Entertainment";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?cs=srgb&dl=pexels-sebastian-ervi-1763075.jpg&fm=jpg";
  myCategories.add(categorieModel);

  //3
  categorieModel = CategorieModel();
  categorieModel.categorieName = "General";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categorieModel);

  //4
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Health";
  categorieModel.imageAssetUrl = "https://us.123rf.com/450wm/ssstocker/ssstocker1609/ssstocker160900170/63054234-healthy-lifestyle-heart-emblem-health-healthy-food-and-active-daily-routine-flat-icons-vector-banner.jpg?ver=6";
  myCategories.add(categorieModel);

  //5
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Science";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = CategorieModel();
  categorieModel.categorieName = "Sports";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Technology";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfa"
      "WQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  return myCategories;

}