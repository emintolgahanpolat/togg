# togg

--> lib

    --> data
    
        --> data_source
        
            --> grpc_client.dart : grpc client yardımcı sınıf
            
            --> local_dart_storage.dart : getsorage ile verilerin kaydedilmesi için yardımcı sınıf
            
        --> protos
        
        --> repo : test yazımını kolaylaştırmak ve dataları yönetmek için repository patterrn kullanılmıştır
        
            --> auth_repo.dart
            
            --> home_repo.dart
            
            --> fav_repo.dart
            
    --> helper
    
        --> firebase : Firebase Analytics işlemleri için yardımcı sınıf
        
        --> logger : renkli log çıktıları
        
    --> page
    
        --> base
        
            -->base_view.dart : provider için view modelin çağrılması
            
        --> favorite
        
            --> page.dart
            
            --> vm.dart
            
        --> home
        
            --> page.dart
            
            --> vm.dart
            
        --> login
        
            --> page.dart
            
            --> vm.dart
            
    --> locator.dart : di için sınıfların tanımlanması
    
    --> main.dart
    
    --> route.dart : naming route yapılması için kullanılıyor.
      
