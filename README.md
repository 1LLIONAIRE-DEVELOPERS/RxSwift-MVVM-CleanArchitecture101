# RxSwift-MVVM-CleanArchitecture101

## CleanArchitecture with RxSwift principle 

1. Don't use disposeBag except UIViewController as possible  
2. Defendency injection in Coordinator or DI Container 
3. Role of Repository is finding proper DataStorage 
4. UseCase does not import or retain other Layer
4-1. If you use API, you must have Entity for convert data to object
so, you make interface converting DTO in entity  
5. ViewControllers know/retain ViewModel 
6. Model in Domain layer is main object in your project 
7. ViewModels give output/information to show in UI 
8. Domain Layer has Repository Interface(it may be protocol)
9. UseCases do not retain Subject for DataStorage as possible
because subject can accept data. It break clean architecture 
10. ViewModel can retain one or many UseCase 
11. Business logic in UseCase, UI Logic in ViewModel, fool ViewController 
12. ViewModel does not know ViewController and Don't import UIkit or RxCocoa(except use Driver for Output)
  


