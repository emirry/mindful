from rest_framework import serializers
from foodjournal.models import FoodJournal, FoodLogItem, User

#Serializers define the API representation
class FoodJournalSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodJournal
        fields = ['date', 'user']
        # depth = 1

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['user_name']

class FoodLogItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodLogItem
        fields = ['food_journal_entry','name', 'calories', 'fat', 'carbs', 'protein']
        depth = 1

