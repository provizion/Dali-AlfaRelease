//
//  ModelController.m
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"
#

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@end

@implementation ModelController
@synthesize pageData;

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        [self createData];
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
      dataViewController.paintObject = [self.pageData objectAtIndex:index] ;
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.paintObject];
}

#pragma mark - Create Data

- (void) createData

{
    
    // initiate the paintObjects
    
    PaintObject *paintObject1 = [[PaintObject alloc] init];
    PaintObject *paintObject2 = [[PaintObject alloc] init];
    PaintObject *paintObject3 = [[PaintObject alloc] init];
    
    //initiate the UIImages of paintings
    
    UIImage *paintImage1 = [UIImage imageNamed:@"paint1.jpg"];
    UIImage *paintImage2 = [UIImage imageNamed:@"paint2.jpg"];
    UIImage *paintImage3 = [UIImage imageNamed:@"paint3.jpg"];
    
    //fill the imageObjects with Content
    
    paintObject1.image = paintImage1;
    paintObject2.image = paintImage2;
    paintObject3.image = paintImage3;
    
    //file the titles of paintings
    
    paintObject1.name = @"Три лебедя";
    paintObject2.name = @"Великий мастурбатор";
    paintObject3.name = @"Постоянство памяти";
    
    //fill the music paths of PaintObject
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: @"Voice1_1" ofType: @"mp3"];
    paintObject1.voice = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    
    NSString *soundFilePath2 = [[NSBundle mainBundle] pathForResource: @"Voice2_1" ofType: @"mp3"];
    paintObject2.voice = [[NSURL alloc] initFileURLWithPath:soundFilePath2];
    
    NSString *soundFilePath3 = [[NSBundle mainBundle] pathForResource: @"Voice3_1" ofType: @"mp3"];
    paintObject3.voice = [[NSURL alloc] initFileURLWithPath:soundFilePath3];
    
    //fill the text
    
      paintObject1.text = @"Необычное полотно  любопытно тем, что если перевернуть его, то слоны превращаются в лебедей, а лебеди, сливаясь с деревьями, — в слонов. Это так называемый известный параноидально-критический метод.Но каков смысл этого «перевертыша»? Чтобы ответить на этот вопрос, обратимся к биографии Гения. Дело в том, что огромную роль в формировании личности Дали сыграла мать. Мать для него была не только матерью, но и любимой женщиной…  После смерти матери, Дали поклялся отвоевать ее у самой Смерти. А теперь вернемся к самой картине. Обратите внимание на девичью часть засохшего дерева и влюбленную парочку в виде облаков. Это основные символы этой картины. Сам же «перевертыш» — это вызов Смерти. Художник надеется на чудо, хочет вернуть свою богиню.  Слева от картины, Дали, вероятно, изобразил себя. Он стоит спиной к этому «таинственному процессу» как бы в отчаянии, и единственное, что греет художника, это воспоминания, которые он изобразил в виде влюбленной парочки-облаков.";
    
      paintObject2.text = @"Прежде чем говорить об этой картине, немного расскажем о жизни художника. Дело в том, что огромную роль в формировании личности Дали сыграла мать. Мать для него была не только матерью, но и любимой женщиной…  После смерти матери, Дали поклялся отвоевать ее у самой Смерти. Многие полотна Дали пронизаны символикой, связанные с ней: где-то Гений высмеивает Смерть, где-то надеется  на скорейшее возвращение матери.Данная картина примечательна тем, что впервые в жизни, художник изобразил лицо матери, но с явными деталями отсутствия жизни. Что же произошло с Гением? Художник полюбил другую женщину (Галу) и образ мертвой матери в сознании художника был заменен реальной женщиной. Картина также изобилует элементами иконографии Дали. Здесь и есть саранча, и «расплющенное» лицо, и муравьи. Существует множество споров по поводу «расплющенного лица»: одни считают, что это прототип скалы в Каталонии, другие, что это лицо художника. Под человеческим лицом, на его рту, сидит саранча— насекомое, перед которым художник испытывал иррациональный страх. По брюшку саранчи и по центральной фигуре ползут муравьи— символ разложения. Под саранчой изображена пара фигур, отбрасывающая одну общую тень. В нижнем левом углу картины одинокая фигура торопливо удаляется вдаль.";
    
    paintObject3.text = @"Это полотно вошло в первый ряд наиболее известных произведений художника. Млеющее лицо с закрытыми глазами уютно расположились на едва заметной скале, олицетворяющий символ матери. Напомню, что огромную роль в формировании личности Дали сыграла мать. Мать для него была не только матерью, но и любимой женщиной…  После смерти матери, Дали поклялся отвоевать ее у самой Смерти. Обратите внимание, на картине расплющенное лицо художника «покрыло» собой мать-скалу, символизируя тем самым порочные сексуальные действия.  Мягкие часы означают, что время остановилось во всех измерениях. Художник как бы впал в летаргический сон. Жизнь художника приобрела порочный блаженный покой. Но для поддержания живого тепла Сальвадор Дали как бы прикармливает часы муравьями , означающий символ морального разложения.  Отметим, что картина была написана в результате ассоциаций, возникших у Дали при виде плавленого сыра…";
    
    self.pageData = [[NSArray alloc] initWithObjects:paintObject1, paintObject2, paintObject3, nil];
          
          
}



#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}



@end
