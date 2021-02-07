# from inventory import views 
# from rest_framework import routers
from django.urls import path
from foodjournal import views

#Routers to provide an easy way of automatically determinging URL conf
# router = routers.SimpleRouter()
# router.register('users', UserViewSet)

#Wire API by using automatic URL routing
urlpatterns = [
    # path('admin/', admin.site.urls),    
    path('foodjournal/', views.food_journal_entry_list),
    path('foodjournal/<int:pk>/', views.food_journal_entry_detail),
    path('food-item/', views.food_log_item_list),
    path('food-item/<int:pk>', views.food_log_item_detail),
]
