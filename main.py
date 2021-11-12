import kivy
from kivy.app import App
from kivy.lang import Builder
from kivy.uix.widget import Widget
from kivy.uix.button import Button
#from kivy.uix.screenmanager import ScreenManager, Screen

#sm = ScreenManager()

class Home(Widget):
    pass

class Badges(Widget):
    pass

#kv = Builder.load_file("cleanTrash.kv")


#screens = [Home(name="home"), Badges(name="badges")]
#for screen in screens:
#    sm.add_widget(screen)

#sm.current = "home"

class CleanTrashApp(App):
    def build(self):
        return Home()

CleanTrashApp().run()