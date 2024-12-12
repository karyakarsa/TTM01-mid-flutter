// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
// import 'package:ttm01_flutter_dependency_injection/ui/controllers/detail_page_controller.dart';
// import 'package:ttm01_flutter_dependency_injection/ui/pages/detail_page.dart';

// import 'detail_page_test.mocks.dart';

// @GenerateNiceMocks([MockSpec<DetailPageController>()])
// void main() {
//   late MockDetailPageController mockController;

//   WidgetsFlutterBinding.ensureInitialized();
//   setUpAll(() {
//     HttpOverrides.global = null;
//   });

//   setUp(() {
//     mockController = MockDetailPageController();

//     // Stub the onStart and onDelete methods
//     when(mockController.onStart)
//         .thenReturn(() {} as InternalFinalCallback<void>);
//     when(mockController.onDelete)
//         .thenReturn(() {} as InternalFinalCallback<void>);

//     Get.put<DetailPageController>(mockController);
//   });

//   tearDown(() {
//     Get.delete<DetailPageController>();
//   });

//   testWidgets('DetailPage displays loading indicator when loading',
//       (WidgetTester tester) async {
//     // Arrange
//     when(mockController.isLoading).thenReturn(RxBool(true));

//     // Act
//     await tester.pumpWidget(
//       GetMaterialApp(
//         home: DetailPage(),
//       ),
//     );

//     // Assert
//     expect(find.byType(CircularProgressIndicator), findsOneWidget);
//   });

//   testWidgets('DetailPage displays no data message when post is null',
//       (WidgetTester tester) async {
//     // Arrange
//     when(mockController.isLoading).thenReturn(RxBool(false));
//     when(mockController.post).thenReturn(Rxn(null));

//     // Act
// await tester.pumpWidget(
//   GetMaterialApp(
//     home: DetailPage(),
//   ),
// );

//     // Assert
//     expect(find.text('No data available'), findsOneWidget);
//   });

//   testWidgets('DetailPage displays post data when post is available',
//       (WidgetTester tester) async {
//     // Arrange
//     final post = Post(userId: 1, id: 1, title: 'Test Title', body: 'Test Body');
//     when(mockController.isLoading).thenReturn(RxBool(false));
//     when(mockController.post).thenReturn(Rx(post) as Rxn<Post>);

//     // Act
//     await tester.pumpWidget(
//       GetMaterialApp(
//         home: DetailPage(),
//       ),
//     );

//     // Assert
//     expect(find.text('userId : 1 '), findsOneWidget);
//     expect(find.text('id : 1 '), findsOneWidget);
//     expect(find.text('title : Test Title '), findsOneWidget);
//     expect(find.text('body : Test Body '), findsOneWidget);
//   });
// }

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/app.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/detail_page_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/home_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/detail_page.dart';

import '../../widget_test.mocks.dart';

@GenerateMocks([PostRepositoryImpl])
void main() {
  final PostRepository mockedRepository = MockPostRepositoryImpl();
  when(mockedRepository.getdetailPost(1)).thenAnswer(
    (_) => Future.value(const Right(
      Post(
        id: 1,
        title: 'my post title',
        body: 'my post body',
        userId: 1,
      ),
    )),
  );
  Get.lazyPut(() => DetailPageController(repo: mockedRepository));
  Get.put<PostRepository>(mockedRepository);

  testWidgets(
      'Should render a list of posts successfully when fetching to remote data source',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const GetMaterialApp(
        home: DetailPage(),
      ),
    );

    await tester.pumpAndSettle();

    // verify that the post title is displayed
    expect(find.text('my post title'), findsOneWidget);
  });
}
