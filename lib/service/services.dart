import 'package:fogofx/models/courseModel.dart';
import 'package:fogofx/models/lessonModel.dart';

class Services {
  static List<CourseModel> shoppingList = [];
  static List<CourseModel> favoritesList = [];
  static List<String> sehirler = [];

  static addToCart(CourseModel courseModel) {
    courseModel.isAddedToCart = true;

    Services.shoppingList.add(
      courseModel

































      
    );
  }

  static addToFav(CourseModel courseModel) {

    courseModel.isAddedToFav = true;

    Services.favoritesList.add(courseModel);
  }

  static removeFromCart(CourseModel courseModel) {
    for (var item in myCourses) {
      if (item.courseId == courseModel.courseId) {
        item.isAddedToCart = false;
      }
    }
    Services.shoppingList.remove(courseModel);
  }

  static removeFromFavorites(CourseModel courseModel) {
    for (var item in myCourses) {
      if (item.courseId == courseModel.courseId) {
        item.isAddedToFav = false;
      }
    }
    Services.favoritesList.remove(courseModel);
  }

  static List<CourseModel> myCourses = [
    CourseModel.withCompletionRate(
        courseId: 1,
        courseName:
            "Modern Web Geliştirme Kursu | Sıfırdan Sektörün Yükseklerine",
        teacher: "Hasan Tarık Yurtseven",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 10,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 2,
        courseName: "Python ile Makine Öğrenmesi & Yapay Zeka Projeleri",
        teacher: "Onur Sayhan",
        courseImage:
            "https://www.ucuncubinyil.com/wp-content/uploads/2020/07/python-kursu.jpg",
        completionRate: 20,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 3,
        courseName:
            "Modern Web Geliştirme Kursu | Sıfırdan Sektörün Yükseklerine",
        teacher: "Hasan Tarık Yurtseven",
        courseImage:
            "https://www.ucuncubinyil.com/wp-content/uploads/2020/07/python-kursu.jpg",
        completionRate: 30,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 4,
        courseName: "Python ile Makine Öğrenmesi & Yapay Zeka Projeleri",
        teacher: "Onur Sayhan",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 40,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 5,
        courseName:
            "Modern Web Geliştirme Kursu | Sıfırdan Sektörün Yükseklerine",
        teacher: "Hasan Tarık Yurtseven",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 50,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 6,
        courseName: "Python ile Makine Öğrenmesi & Yapay Zeka Projeleri",
        teacher: "Onur Sayhan",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 60,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 7,
        courseName:
            "Modern Web Geliştirme Kursu | Sıfırdan Sektörün Yükseklerine",
        teacher: "Hasan Tarık Yurtseven",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 70,
        isAddedToCart: false,
        isAddedToFav: false)
  ];

  static List<CourseModel> categoryContentList = [
    CourseModel.withCompletionRate(
        courseId: 1,
        courseName:
            "Modern Web Geliştirme Kursu | Sıfırdan Sektörün Yükseklerine",
        teacher: "Hasan Tarık Yurtseven",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 10,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 2,
        courseName: "Python ile Makine Öğrenmesi & Yapay Zeka Projeleri",
        teacher: "Onur Sayhan",
        courseImage:
            "https://www.ucuncubinyil.com/wp-content/uploads/2020/07/python-kursu.jpg",
        completionRate: 20,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 3,
        courseName:
            "Modern Web Geliştirme Kursu | Sıfırdan Sektörün Yükseklerine",
        teacher: "Hasan Tarık Yurtseven",
        courseImage:
            "https://www.ucuncubinyil.com/wp-content/uploads/2020/07/python-kursu.jpg",
        completionRate: 30,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 4,
        courseName: "Python ile Makine Öğrenmesi & Yapay Zeka Projeleri",
        teacher: "Onur Sayhan",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 40,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 5,
        courseName:
            "Modern Web Geliştirme Kursu | Sıfırdan Sektörün Yükseklerine",
        teacher: "Hasan Tarık Yurtseven",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 50,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 6,
        courseName: "Python ile Makine Öğrenmesi & Yapay Zeka Projeleri",
        teacher: "Onur Sayhan",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 60,
        isAddedToCart: false,
        isAddedToFav: false),
    CourseModel.withCompletionRate(
        courseId: 7,
        courseName:
            "Modern Web Geliştirme Kursu | Sıfırdan Sektörün Yükseklerine",
        teacher: "Hasan Tarık Yurtseven",
        courseImage:
            "https://birkarefotograf.com/wp-content/uploads/2018/11/net-keskin-fotograf-cekmek-icin-ipuclari.jpg",
        completionRate: 70,
        isAddedToCart: false,
        isAddedToFav: false)
  ];

  static List<LessonModel> lessonList1 = [
    LessonModel(lessonName: "Bölüm Tanıtımı", lessonId: 1),
    LessonModel(lessonName: "Temel Kurulumlar", lessonId: 2),
    LessonModel(lessonName: "Programlama Nedir?", lessonId: 3),
    LessonModel(lessonName: "Temel Değişken Yapısını Anlamak", lessonId: 4),
  ];

  static List<LessonModel> lessonList2 = [
    LessonModel(lessonName: "Python Tanıtımı", lessonId: 5),
    LessonModel(lessonName: "Değişkenler Tanıtımı", lessonId: 6),
    LessonModel(lessonName: "String Fonksiyonlar?", lessonId: 7),
    LessonModel(lessonName: "Inputlarla Çalışmak", lessonId: 8),
  ];

  static List<LessonModel> lessonList3 = [
    LessonModel(lessonName: "Bölüm Tanıtımı", lessonId: 9),
    LessonModel(lessonName: "Temel Kurulumlar", lessonId: 10),
    LessonModel(lessonName: "Programlama Nedir?", lessonId: 11),
    LessonModel(lessonName: "Temel Değişken Yapısını Anlamak", lessonId: 12),
  ];
}
