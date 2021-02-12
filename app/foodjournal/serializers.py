from rest_framework import serializers, fields
from foodjournal.models import FoodJournal, FoodLogItem, User

#Serializers define the API representation

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['user_name']
        depth = 1

class FoodLogItemSerializer(serializers.ModelSerializer):
    # journal_entries = FoodJournalSerializer(many=True)
    class Meta:
        model = FoodLogItem
        fields = ['id', 'name', 'calories', 'fat', 'carbs', 'protein', 'entry']

    # def create(self, validated_data):
    #     journal_entries = validated_data.pop('journal_entries')
    #     food = FoodLogItem.objects.create(**validated_data)
    #     for entry in journal_entries:
    #         FoodJournal.objects.create(entry=food, **entry)
    #     return food

    # def update(self, instance, validated_data):
    #     journal_entries = validated_data.pop('journal_entries')
    #     entries = (instance.food_items).all()
    #     entries = list(entries)
    #     instance.name = validated_data.get('name', instance.name)
    #     instance.calories = validated_data.get('calories', instance.calories)
    #     instance.carbs = validated_data.get('carbs', instance.carbs)
    #     instance.fat = validated_data.get('fat', instance.fat)
    #     instance.protein = validated_data.get('protein', instance.protein)
    #     instance.save()

    #     for entry in journal_entries:
    #         entry = entries.pop(0)
    #         entry.date = date.get('date', entry.date)
    #         entry.save()
    #     return instance

class FoodJournalSerializer(serializers.ModelSerializer):
    food_entries = FoodLogItemSerializer(many=True)

    class Meta:
        model = FoodJournal
        fields = ['id', 'date', 'user', 'food_entries']

        # fields = ['id', 'date', 'user', 'journal_items', 'items']
        # fields = ['id', 'date', 'user', 'food_log_item']
        # depth = 1

    def create(self, validated_data):
        foods_data = validated_data.pop('food_entries')
        journal = FoodJournal.objects.create(**validated_data)
        for food in foods_data:
            FoodLogItem.objects.create(entry=journal, **food)
        return journal 
    
    def update(self, instance, validated_data):
        foods_data = validated_data.pop('food_entries')
        foods = (instance.journal_items).all()
        foods = list(foods)
        instance.date = validated_data.get('date', instance.date)
        instance.save()

        for food in foods_data:
            food = foods.pop(0)
            food.date = food.get('date', food.date)
            food.name = food.get('name', food.name)
            food.calories = food.get('calories', food.calories)
            food.fat = food.get('fat', food.fat)
            food.carbs = food.get('carbs', food.carbs)
            food.protein = food.get('protein', food.protein)
            food.save()
        return instance

