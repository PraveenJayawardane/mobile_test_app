import 'package:get_it/get_it.dart';

import 'features/navigation/presentation/screens/navigation_screen/navigation_block.dart';

var sl = GetIt.instance;

Future<void> setup() async {
  sl.registerFactory(() => NavigationBlock());
  // sl.registerFactory(() => AttachmentBloc(
  //     uploadImageUsecase: sl(),
  //     setMessageUsecase: sl(),
  //     uploadFileUserCase: sl()));
  // sl.registerFactory(() => ChatBloc(getSearchChatUsecase: sl()));
  // sl.registerFactory(() => SingleCourseBloc(getSingleCoursesUsecase: sl()));
  // sl.registerFactory(() => InitialBloc(authLocalDataSource: sl()));
  // sl.registerFactory(() => MyCourseBloc(myCoursesUsecase: sl()));
  // sl.registerFactory(() => NotificationBloc(getAllNotificationUsecase: sl()));
  // sl.registerFactory(() => UpdateProfileBloc(updateProfileUsecase: sl()));
  // sl.registerFactory(() => MenuBloc(logoutUsecase: sl()));
  // sl.registerFactory(() => NewsBloc(getNewsUsecase: sl()));
  // sl.registerFactory(() => PrivacyPolicyBloc(getPrivacyPolicyUsecase: sl()));
  // sl.registerFactory(() => HelpBloc(getHelpUsecase: sl()));
  // sl.registerFactory(() => EventBloc(getEventUsecase: sl()));
  // sl.registerFactory(() => ForgotPasswordBloc(
  //     resetPasswordUsecase: sl(), defaultLoginUsecase: sl()));
  // sl.registerFactory(() => CourseMeetingBloc(getZoomLinkUsecase: sl()));
  // sl.registerFactory(
  //         () => EventViewBloc(getHtmlUsecase: sl(), getVideoUsecase: sl()));
  // sl.registerFactory(() async => await SharedPreferences.getInstance());
  // sl.registerLazySingleton(() => LoginUsecase(authRepository: sl()));
  // sl.registerLazySingleton(() => GetVideoUsecase(courseRepository: sl()));
  // sl.registerLazySingleton(() => GetHtmlUsecase(courseRepository: sl()));
  // sl.registerLazySingleton(() => GetZoomLinkUsecase(courseRepository: sl()));
  // sl.registerLazySingleton(
  //         () => GetSingleCoursesUsecase(courseRepository: sl()));
  // sl.registerLazySingleton(
  //         () => GetPrivacyPolicyUsecase(privacyPolicyRepository: sl()));
  // sl.registerLazySingleton(() => GetMyCoursesUsecase(courseRepository: sl()));
  // sl.registerLazySingleton(
  //         () => GetAllNotificationUsecase(notificationRepository: sl()));
  // sl.registerLazySingleton(() => ResetPasswordUsecase(authRepository: sl()));
  // sl.registerLazySingleton(() => GetChatUsecase(chatRepository: sl()));
  // sl.registerLazySingleton(() => GetSearchChatUsecase(chatRepository: sl()));
  // sl.registerLazySingleton(() => GetSingleChatUsecase(chatRepository: sl()));
  // sl.registerLazySingleton(() => GetEventUsecase(eventRepository: sl()));
  // sl.registerLazySingleton(
  //         () => GetSingleChatMessageUsecase(chatRepository: sl()));
  // sl.registerLazySingleton(() => SetMessageUsecase(chatRepository: sl()));
  // sl.registerLazySingleton(
  //         () => GetLocalStoragePermissionUsecase(permissionRepository: sl()));
  // sl.registerLazySingleton(() => DefaultLoginUsecase(authRepository: sl()));
  // sl.registerLazySingleton(() => UploadFileUserCase(chatRepository: sl()));
  // sl.registerLazySingleton(
  //         () => SaveToLocalStorageUsecase(chatRepository: sl()));
  // sl.registerLazySingleton(() => UploadImageUsecase(chatRepository: sl()));
  // sl.registerLazySingleton(() => LogoutUsecase(authRepository: sl()));
  // sl.registerLazySingleton(() => UpdateProfileUsecase(authRepository: sl()));
  // sl.registerLazySingleton(() => GetNewsUsecase(newsRepository: sl()));
  // sl.registerLazySingleton(() => GetHelpUsecase(helpRepository: sl()));
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton<AuthLocalDataSource>(
  //         () => AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences));
  // sl.registerLazySingleton<PrivacyPolicyRemoteDataSource>(
  //         () => PrivacyPolicyRemoteDataSourceImpl(client: http.Client()));
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
  //     authRemoteDataSource: sl(), authLocalDataSource: sl()));
  // sl.registerLazySingleton<CourseRepository>(() =>
  //     CourseRepositoryImpl(remoteDataSource: sl(), authLocalDataSource: sl()));
  // sl.registerLazySingleton<PrivacyPolicyRepository>(
  //         () => PrivacyPolicyRepositoryImpl(privacyPolicyRemoteDataSource: sl()));
  // sl.registerLazySingleton<NotificationRepository>(
  //         () => NotificationRepositoryImpl(notificationRemoteDataSource: sl()));
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //         () => AuthRemoteDataSourceImpl(client: http.Client()));
  // sl.registerLazySingleton<NewsRemoteDataSource>(
  //         () => NewsRemoteDataSourceImpl(client: http.Client()));
  // sl.registerLazySingleton<PermissionRepository>(
  //         () => PermissionRepositoryImpl());
  // sl.registerLazySingleton<CourseRemoteDataSource>(
  //         () => CourseRemoteDataCourseImpl(client: http.Client()));
  // sl.registerLazySingleton<HelpRemoteDataSource>(
  //         () => HelpRemoteDataSourceImpl(client: http.Client()));
  // final FirebaseFirestore fireBaseClient = FirebaseFirestore.instance;
  // final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  // sl.registerLazySingleton<NotificationRemoteDataSource>(
  //         () => NotificationRemoteDataSourceImpl(firebaseClient: fireBaseClient));
  // sl.registerLazySingleton<ChatFirebaseDataSource>(() =>
  //     ChatFirebaseDataSourceImpl(
  //         client: http.Client(),
  //         firebaseClient: fireBaseClient,
  //         firebaseStorage: firebaseStorage));
  // sl.registerLazySingleton<EventRemoteDataSource>(
  //         () => EventRemoteDataSourceImpl(client: http.Client()));
  // sl.registerLazySingleton<ChatRepository>(
  //         () => ChatRepositoryImpl(chatFirebaseDataSource: sl()));
  // sl.registerLazySingleton<EventRepository>(
  //         () => EventRepositoryImpl(eventRemoteDataSource: sl()));
  // sl.registerLazySingleton<NewsRepository>(
  //         () => NewsRepositoryImpl(newsRemoteDataSource: sl()));
  // sl.registerLazySingleton<HelpRepository>(
  //         () => HelpRepositoryImpl(privacyPolicyRemoteDataSource: sl()));
}
