from django.shortcuts import render
from rest_framework import status 
from rest_framework.decorators import api_view
from rest_framework.response import Response 

from .models import FoodJournal, FoodLogItem
from .seriarlizers import *

@api_view(['GET', 'POST'])
def food_journal_entry_list(request):
    """
    List all journal entries or create a new entry
    """

    if request.method == 'GET':
        food_journal_entries = FoodJournal.objects.all()
        serializer = FoodJournalSerializer(food_journal_entries, context={'request' : requeset}, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer =  FoodJournalSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def food_journal_entry_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    try:
        food_journal_entry = FoodJournal.objects.get(pk=pk)
    except FoodJournal.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = FoodJournalSerializer(food_journal_entry, context={'request' : requeset})
        return Response(serializer.data)
    elif request.method == 'PUT':
        serializer = FoodJournalSerializer(food_journal_entry, context={'request' : requeset}, many=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif requeset.method == 'DELETE':
        food_journal_entry.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class food_log_items(generics.ListCreateAPIView):
    queryset = FoodLogItem.objects.all()
    serializer_class = FoodLogItemSerializer

class food_log_item_detail(generics.RetrieveUpdateDestroyAPIView):
    queryset = FoodLogItem.objects.all()
    serializer_class = FoodLogItemSerializer


