from kivy.app import App
from kivy.lang import Builder
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.properties import ObjectProperty
from kivy.uix.popup import Popup
from kivy.uix.label import Label
from database import DataBase


class CreateAccountWindow(Screen):
    namee = ObjectProperty(None)
    username = ObjectProperty(None)
    email = ObjectProperty(None)
    password = ObjectProperty(None)

    def submit(self):
        print(type(self.namee))
        print(type(self.username))
        print(type(self.email))
        print(type(self.password))
        if self.namee.text != "" and self.email.text != "" and self.email.text.count("@") == 1 \
                and self.email.text.count(".") > 0 and self.username.text != "":
            if self.password != "":
                db.add_user(self.username.text, self.namee.text, self.password.text, self.email.text)

                self.reset()

                sm.current = "login"
            else:
                invalidForm()
        else:
            invalidForm()

    def login(self):
        self.reset()
        sm.current = "login"

    def reset(self):
        self.email.text = ""
        self.password.text = ""
        self.namee.text = ""
        self.username.text = ""


class LoginWindow(Screen):
    username = ObjectProperty(None)
    password = ObjectProperty(None)

    def loginBtn(self):
        if db.validate(self.username.text, self.password.text):
            MainWindow.current = self.username.text
            self.reset()
            sm.current = "main"
        else:
            invalidLogin()

    def createBtn(self):
        self.reset()
        sm.current = "create"

    def reset(self):
        self.username.text = ""
        self.password.text = ""


class MainWindow(Screen):
    n = ObjectProperty(None)
    email = ObjectProperty(None)
    username = ObjectProperty(None)
    current = ""

    def logOut(self):
        sm.current = "login"

    def on_enter(self, *args):
        namee, password, email = db.get_user(self.current)
        self.n = "Account Name: " + namee
        self.email = "Email: " + email
        self.username = "Username: " + self.current


class WindowManager(ScreenManager):
    pass


def invalidLogin():
    pop = Popup(title='Invalid Login',
                  content=Label(text='Invalid username or password.'),
                  size_hint=(None, None), size=(400, 400))
    pop.open()


def invalidForm():
    pop = Popup(title='Invalid Form',
                  content=Label(text='Please fill in all inputs with valid information.'),
                  size_hint=(None, None), size=(400, 400))

    pop.open()


kv = Builder.load_file("my.kv")

sm = WindowManager()
db = DataBase("users.txt")

screens = [LoginWindow(name="login"), CreateAccountWindow(name="create"), MainWindow(name="main")]
for screen in screens:
    sm.add_widget(screen)

sm.current = "login"


class MyMainApp(App):
    def build(self):
        return sm


if __name__ == "__main__":
    MyMainApp().run()
