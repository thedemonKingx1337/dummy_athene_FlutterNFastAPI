from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI()


class PersonModel(BaseModel):
    id: int
    name: str
    position: str
    image: str
    description: str


persons = [
    {
        "id": 1,
        "name": "Aravind PB",
        "position": "Dev N JOC of Athene",
        "image": "https://i.pinimg.com/564x/0c/01/d4/0c01d4f1511e34117d55625c67ada8fa.jpg",
        "description": "Long Live FLUTTER <3!"
    },
    {
        "id": 2,
        "name": "Anas Khan",
        "position": "Account Manager",
        "image": "https://i.pinimg.com/564x/21/d9/27/21d927b08ff528474f696e264e1f688e.jpg",
        "description": "Director at UST"
    }, {
        "id": 3,
        "name": "Navya",
        "position": "Python Dev",
        "image": "https://media.licdn.com/dms/image/v2/D5603AQE49Hs80DFiaQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1673459453790?e=1734566400&v=beta&t=TKuHJBOGkszlHakudJj0yEDgwcUriBNZb345hU8RlZQ",
        "description": "Python Dev of the Athene"
    },
]


@app.get("/v1/person/getAllPerson", response_model=List[PersonModel])
def get_all_persons():
    return persons
