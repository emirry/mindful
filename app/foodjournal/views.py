from rest_framework import status 
from rest_framework.decorators import api_view
from rest_framework.response import Response 
from foodjournal.models import FoodJournal, FoodLogItem, User
from foodjournal.serializers import FoodJournalSerializer, FoodLogItemSerializer, UserSerializer
from datetime import date

wanted_date = FoodJournal.objects.filter(date=date.today())
# wanted_date = FoodJournal.objects.filter(date="2021-02-08")

@api_view(['GET', 'POST'])
def food_journal_entry_list(request):
    """
    List all journal entries or create a new entry
    """
    if request.method == 'GET':
        print(FoodJournal.objects.filter(date="2021-02-08"))

        entries = FoodJournal.objects.all()
        serializer = FoodJournalSerializer(entries, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        # check db if date already exists, modify existing entry
        print("HERE", wanted_date)

        if not wanted_date: 
            print("INSIDE IF")
            #add food items 
            serializer = FoodJournalSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        #if it doesn't, it'll be a new entry
        else:
            # food_journal_entry_detail(request, pk)
            serializer = FoodJournalSerializer(data=request.data.update)
          

@api_view(['GET', 'PUT', 'DELETE'])
def food_journal_entry_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    try:
        entry = FoodJournal.objects.get(pk=pk)
    except FoodJournal.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = FoodJournalSerializer(entry)
        return Response(serializer.data)
    elif request.method == 'PUT':
        # data = JSONParser().parse(request)
        print("HERE")
        serializer = FoodJournalSerializer(entry, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        entry.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['GET', 'POST'])
def food_log_item_list(request):
    """
    List all journal entries or create a new entry
    # """
    # queryset = FoodLogItem.objects.all()
    # serializer_class = FoodLogItemSerializer

    if request.method == 'GET':
        foods = FoodLogItem.objects.all()
        serializer = FoodLogItemSerializer(foods, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        # data = JSONParser().parse(request)
        today = "2021-02-08"
        food_journal_entry = FoodJournal.objects.filter(date=today)
        # print("LOOK HERE:", food_journal_entry)
        print("LOOK HERE",food_journal_entry)
        working = {**request.data,**{"food_journal_entry": food_journal_entry[0].id}}
        serializer = FoodLogItemSerializer(data=working)

        #  serializer = FoodLogItemSerializer(data=request.data)
         #add code to find journal entry date
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['GET', 'PUT', 'DELETE'])
def food_log_item_detail(request, pk):
    """
    Retrieve, update or delete a journal entry instance
    """
    try:
        food = FoodLogItem.objects.get(pk=pk)
    except FoodLogItem.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = FoodLogItemSerializer(food)
        return Response(serializer.data)
    elif request.method == 'PUT':
        # data = JSONParser().parse(request)
        serializer = FoodLogItemSerializer(food, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        food.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

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
        # data = JSONParser().parse(request)
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
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = UserSerializer(user)
        return Response(serializer.data)
    elif request.method == 'PUT':
        # data = JSONParser().parse(request)
        serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)



