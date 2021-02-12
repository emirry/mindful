from rest_framework import status 
from rest_framework.decorators import api_view
from rest_framework.response import Response 
from foodjournal.models import FoodJournal, FoodLogItem, User
from foodjournal.serializers import FoodJournalSerializer, FoodLogItemSerializer, UserSerializer
from datetime import date
from datetime import datetime

wanted_date = date.today()

@api_view(['GET', 'POST'])
def food_journal_entry_list(request):
    """
    List all journal entries or create a new entry
    """
    if request.method == 'GET':
        print(FoodJournal.objects.filter(date=date.today()))

        entries = FoodJournal.objects.filter(date="2021-02-12")
        serializer = FoodJournalSerializer(entries, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        # check db if date already exists, modify existing entry
        print("HERE", wanted_date)

        # if not wanted_date: 
        #     print("INSIDE IF")
            #add food items 
        serializer = FoodJournalSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        #if it doesn't, it'll be a new entry
        # else:
        #     serializer = FoodJournalSerializer(data=request.data.update)
        #     if serializer.is_valid():
        #         serializer.save()
        #     return Response(serializer.data, status=status.HTTP_201_CREATED)          

@api_view(['GET', 'PUT', 'DELETE'])
def food_journal_entry_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    try:
        entry = FoodJournal.objects.get(pk=pk)
    except FoodJournal.DoesNotExist:
        return Response({'message': 'Sorry, that item does not exist'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = FoodJournalSerializer(entry)
        return Response(serializer.data)
    elif request.method == 'PUT':
        print("HERE")
        serializer = FoodJournalSerializer(entry, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        entry.delete()
        return Response({'message': 'Item was deleted successfully!'}, status=status.HTTP_204_NO_CONTENT)

@api_view(['GET', 'POST'])
def food_log_item_list(request):
    """
    List all journal entries or create a new entry
    """

    if request.method == 'GET':
        foods = FoodLogItem.objects.all()
        serializer = FoodLogItemSerializer(foods, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = FoodLogItemSerializer(data=request.data)
        print("HERE!!", serializer)
        if serializer.is_valid():
            serializer.save()

            journal_entry = {
                "date": wanted_date,
                "food_entries": [request.data]
            }
            
            entry_serializer = FoodJournalSerializer(data=journal_entry)
            print("AKEJGAJG", entry_serializer)

            if entry_serializer.is_valid():
                entry_serializer.save()
                return Response(entry_serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['GET', 'PUT', 'DELETE'])
def food_log_item_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    try:
        food = FoodLogItem.objects.get(pk=pk)
    except FoodLogItem.DoesNotExist:
        return Response({'message': 'Sorry, that item does not exist'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = FoodLogItemSerializer(food)
        return Response(serializer.data)
    elif request.method == 'PUT':
        serializer = FoodLogItemSerializer(food, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        food.delete()
        return Response({'message': 'Item was deleted successfully!'}, status=status.HTTP_204_NO_CONTENT)

@api_view(['GET', 'POST'])
def user_list(request):
    """
    List all users or create a new user
    """

    if request.method == 'GET':
        users = User.objects.all()
        serializer = UserSerializer(users, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer =  UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def user_detail(request, pk):
    """
    Retrieve, update or delete a user instance
    """
    try:
        user = User.objects.get(pk=pk)
    except FoodLogItem.DoesNotExist:
        return Response({'message': 'Sorry, that item does not exist'}, status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = UserSerializer(user)
        return Response(serializer.data)
    elif request.method == 'PUT':
        serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        user.delete()
        return Response({'message': 'Item was deleted successfully!'}, status=status.HTTP_204_NO_CONTENT)



