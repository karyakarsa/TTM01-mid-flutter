import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/app.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([PostRepositoryImpl])
void main() {
  final PostRepository mockedRepository = MockPostRepositoryImpl();

  Get.put<PostRepository>(mockedRepository);

  testWidgets(
      'Should render a list of posts successfully when fetching to remote data source',
      (WidgetTester tester) async {
    when(mockedRepository.getAll()).thenAnswer(
      (_) => Future.value(const Right(<Post>[
        Post(
          id: 1,
          title: 'my post title',
          body: 'my post body',
          userId: 1,
        ),
      ])),
    );
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    await tester.pumpAndSettle();

    // verify that the post title is displayed
    expect(find.text('my post title'), findsOneWidget);
    expect(find.text('my post body'), findsOneWidget);
  });
}
