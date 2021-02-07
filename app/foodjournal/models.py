from django.db import models

class FoodJournal(models.Model):
    date = models.DateField(auto_now=True, blank=False, null=False)
    food_log_item = models.ForeignKey('FoodLogItem', on_delete=models.CASCADE)
    #how will I store nutrition meters?

    def get_absolute_url(self):
        '''
        Returns the url to access a particular instance of FoodJournal.
        '''
        return reverse('food-journal-detail-view', args=[str(self.id)])
    
class FoodLogItem(models.Model):
    name = models.CharField(max_length=100, blank=False, null=False)
    calories = models.IntegerField(blank=False, null=False)
    fat = models.FloatField()
    protein = models.FloatField()
    carbs = models.FloatField()

    def get_absolute_url(self):
        return reverse('food-log-item-detail-view', args=[str(self.id)])