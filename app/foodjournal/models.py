from django.db import models
from datetime import date

class User(models.Model):
    user_name = models.CharField(max_length=50, blank=True)
    maleOrFemale = models.CharField(max_length=10, blank=False)
    weight = models.IntegerField(blank=False)
    height = models.IntegerField(blank=False)
    age = models.IntegerField(blank=False)
    activity_level = models.IntegerField(blank=False)


    def bmr_calculations(mOrF, user_weight, user_height, user_age):
        #Basal Metabolic Rate
        weightInKgs = user_weight / 2.2
        heightInCent = user_height * 2.54
        if mOrF == "M":
            bmr = int((10 * weightInKgs) + (6.25 * heightInCent) - (5 * user_age) + 5)
        elif mOrF == "F":
            bmr = int((10 * weightInKgs) + (6.25 * heightInCent) - (5 * user_age) - 161)
        return bmr

    def daily_caloric_needs(bmr, activityLevel):
        """
            1 = Sedentary
            2 = Exercise 1 - 3 times a week
            3 = Exercise 4 - 5 times a week
            4 = Daily Exercise or intense exercise 3-4 times a week
            5 = Intense Exercise 6 times a week
        """

        if activityLevel == 1:
            levelIndex = 1.2
        elif activityLevel == 2:
            levelIndex = 1.375
        elif activityLevel == 3:
            levelIndex = 1.46
        elif activityLevel == 4:
            levelIndex = 1.725
        elif activityLevel == 5:
            levelIndex = 1.9
        
        #Recommended caloric intake to maintain weight
        dailyCalIntake = int(bmr * levelIndex)
        return dailyCalIntake

    def calculate_macros(calories):
        #calories = dailyCalIntake
        #Calculate maintenance macros 
        cal_from_protein = int(.4 * calories)
        grams_of_protein = int(cal_from_protein / 4)
        cal_from_carbs = int(.4 * calories)
        grams_of_carbs = int(cal_from_protein / 4)
        cal_from_fat = int(.2 * calories)
        grams_of_fat = int(cal_from_fat / 9)

        #based on caloric intake, this calculates caloric intake of P/C/F and grams

    # INFO TO RETURN:
    # print("HERE", type(weight))
    # bmr = bmr_calculations(maleOrFemale, weight, height, age)
    # dailyCalIntake = daily_caloric_needs(bmr)
    # calculate_macros(dailyCalIntake)


class FoodJournal(models.Model):
    date = models.DateField(auto_now=True, blank=False, null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    # items = models.ForeignKey('FoodLogItem', on_delete=models.CASCADE, related_name='journal_entries', blank=True, null=True)
    #how will I store nutrition meters?

      
class FoodLogItem(models.Model):
    entry = models.ForeignKey(FoodJournal, on_delete=models.CASCADE, related_name='food_entries', blank=True, null=True)
    # date = models.DateField(auto_now=True, blank=False, null=False)
    name = models.CharField(max_length=100, blank=False)
    calories = models.IntegerField(blank=False)
    fat = models.FloatField()
    protein = models.FloatField()
    carbs = models.FloatField()
