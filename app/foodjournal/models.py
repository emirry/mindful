from django.db import models
from datetime import date

class User(models.Model):
    user_name = models.CharField(max_length=50, blank=False) 

    # def get_absolute_url(self):
    #     return reverse('user-detail-view', args=[str(self.id)])

class FoodJournal(models.Model):
    date = models.DateField(auto_now=True, blank=False, null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    food_log_item = models.ForeignKey('FoodLogItem', on_delete=models.CASCADE)
    #how will I store nutrition meters?

    # def get_absolute_url(self):
    #     '''
    #     Returns the url to access a particular instance of FoodJournal.
    #     '''
    #     return reverse('food-journal-entry-detail-view', args=[str(self.id)])
   
class FoodLogItem(models.Model):
    # food_journal_entry = models.ForeignKey(FoodJournal, on_delete=models.CASCADE)
    name = models.CharField(max_length=100, blank=False)
    calories = models.IntegerField(blank=False)
    fat = models.FloatField()
    protein = models.FloatField()
    carbs = models.FloatField()

    # def get_absolute_url(self):
    #     return reverse('food-item-detail-view', args=[str(self.id)])