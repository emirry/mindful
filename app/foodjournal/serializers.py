from rest_framework import serializers
from foodjournal.models import FoodJournal, FoodLogItem, User

#Serializers define the API representation
class FoodJournalSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodJournal
        fields = ['id', 'date', 'user', 'food_log_item']
        depth = 1

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['user_name']
        depth = 1

class FoodLogItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodLogItem
        fields = ['name', 'calories', 'fat', 'carbs', 'protein']
        # depth = 1

