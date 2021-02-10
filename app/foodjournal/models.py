from django.db import models
from datetime import date

class User(models.Model):
    user_name = models.CharField(max_length=50, blank=False) 

class FoodJournal(models.Model):
    date = models.DateField(auto_now=True, blank=False, null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    # food_log_item = models.ForeignKey('FoodLogItem', on_delete=models.CASCADE, related_name='journal_items')
    #how will I store nutrition meters?

    
   
class FoodLogItem(models.Model):
    entry = models.ForeignKey(FoodJournal, on_delete=models.CASCADE, related_name='journal_items')
    name = models.CharField(max_length=100, blank=False)
    calories = models.IntegerField(blank=False)
    fat = models.FloatField()
    protein = models.FloatField()
    carbs = models.FloatField()
