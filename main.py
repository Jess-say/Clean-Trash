from kivy.app import App
from kivy.lang import Builder
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.properties import ObjectProperty
from kivy.uix.popup import Popup
from kivy.uix.label import Label
from kivy.uix.label import Widget
#from database import DataBase


class CreateAccountWindow(Screen):
    username = ObjectProperty(None)
    password = ObjectProperty(None)
    email = ObjectProperty(None)
    name = ObjectProperty(None)

    def submit(self):
        if self.username.text != "" and self.email.text != "" and self.email.text.count("@") == 1 and self.email.text.count(".") > 0 and self.name.text != "":
            if self.password != "":
                #db.add_user(self.email.text, self.password.text, self.username.text, self.name.text)

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
        self.password.text = ""
        self.username.text = ""
        self.email.text = ""


class LoginWindow(Screen):
    username = ObjectProperty(None)
    password = ObjectProperty(None)

    def loginBtn(self):
        #if db.validate(self.username.text, self.password.text):
         #   MainWindow.current = self.username.text
          #  self.reset()
          #  sm.current = "main"

       # else:
        #    invalidLogin()
            sm.current = "main"

    def createBtn(self):
        self.reset()
        sm.current = "create"

    def reset(self):
        self.username.text = ""
        self.password.text = ""


class MainWindow(Screen):
    def badgeBtn(self):
        self.reset()
        sm.current = "badge"

    def settingsBtn(self):
        self.reset()
        sm.current = "settings"

    def PlasticBtn(self):
        sm.current = "camera"

    def GlassBtn(self):
        sm.current = "camera"

    def PaperBtn(self):
        sm.current = "camera"

    def MetalBtn(self):
        sm.current = "camera"

    def CardboardBtn(self):
        sm.current = "camera"

    def OtherBtn(self):
        sm.current = "camera"


class Badges(Widget):
    pass

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


kv = Builder.load_file("cleanTrash.kv")

sm = WindowManager()
#db = DataBase("users.txt")

screens = [LoginWindow(name="login"), CreateAccountWindow(name="create"), MainWindow(name="main"),CameraWindow(name="camera")]
for screen in screens:
    sm.add_widget(screen)

sm.current = "login"


class MyMainApp(App):
    def build(self):
        return sm


if __name__ == "__main__":
    MyMainApp().run()