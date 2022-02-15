from bs4 import BeautifulSoup
import requests

recyclable_items = dict()

# scrapes a UCR county website to a list of recyclable items
# returns dictionary where key is class type like glass, paper 
# and value is the list of items in that class that are recyclable 
def get_recyclable_items():
    # HTML file has in order of: Paper, Plastic, Glass, Metal, Polystyrene
    item_type = ["paper", "plastic", "glass", "metal", "polystyrene"]
    
    # url = "https://www.riversideca.gov/publicworks/trash/recycling-what.asp"
    url = "https://www.riversideca.gov/publicworks/trash/recycling-what.asp"
    page = requests.get(url)
    doc = BeautifulSoup(page.content, "html.parser")
    # print(doc.prettify)
    contentTable  = doc.find('table', { "class" : "borderbox"}) # Use dictionary to pass key : value pair
    rows = contentTable.find_all('ul') # Extract and return first occurrence of tr
    for i in range(len(rows)):          # Print all occurrences
        list_of_items = rows[i].get_text().strip().split("\n")
        for x in range(len(list_of_items)):
            item = list_of_items[x].lower()
            if "/" in item:
                items = item.split("/")
                list_of_items.remove(list_of_items[x])
                last_word = items[-1].split()[-1]
                for y in range(len(items)-1):
                    list_of_items.append(items[y] + " " + last_word)
                list_of_items.append(items[-1])
            else:
                list_of_items[x] = list_of_items[x].lower()
        recyclable_items[item_type[i]] = list_of_items

    # manually add soda can, equivalent to aluminum
    recyclable_items["metal"].append("soda can")
    # for key, value in recyclable_items.items():
    #     print(key, value)

    return recyclable_items

# check is item is recyclable or not, ex: "soda can"
def check_if_recyclable(item):
    item = item.lower()
    for key, value in recyclable_items.items():
        for product in value:
            if item in product:
                print("Recyclable")
                return True 
    print("Not Recyclable")     
    return False

def main():
    get_recyclable_items()
    # check_if_recyclable("soda can")

if __name__ == "__main__":
    main()