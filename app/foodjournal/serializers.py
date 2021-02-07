#Serializers define the API representation
class FoodJournalSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = FoodJournal
        fields = ('date', 'food_log_item')
        # depth = 1

class FoodLogItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodLogItem
        fields = ('name', 'calories', 'fat', 'carbs', 'protein')

