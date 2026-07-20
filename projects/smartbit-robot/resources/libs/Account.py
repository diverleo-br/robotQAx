
#usado para importar a biblioteca faker no pyton
from faker import Faker

#o faker gera dados dinamicos 
fake = Faker ('pt_BR')
def get_fake_account():
    account = {
        "name": fake.name(),
        "email": fake.email(),
        "cpf": fake.cpf()
    }
    return account