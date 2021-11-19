import kivy
from kivy.app import App
from kivy.lang import Builder
from kivy.uix.widget import Widget
from kivy.uix.button import Button
from kivy.base import runTouchApp #for scrolling on badges page
from kivy.uix.camera import Camera #camera
from kivy.uix.boxlayout import BoxLayout #camera layout
from kivy.uix.screenmanager import ScreenManager, Screen

class HomeWindow(Screen):
    def badgeBtn(self):
        self.reset()
        sm.current = "badge"

    def settingsBtn(self):
        self.reset()
        sm.current = "settings"

    def PlasticBtn(self):
        self.reset()
        sm.current = "camera"

    def GlassBtn(self):
        self.reset()
        sm.current = "camera"

    def PaperBtn(self):
        self.reset()
        sm.current = "camera"

    def MetalBtn(self):
        self.reset()
        sm.current = "camera"

    def CardboardBtn(self):
        self.reset()
        sm.current = "camera"

    def OtherBtn(self):
        self.reset()
        sm.current = "camera"

class BadgeWindow(Screen):
    def homeBtn(self):
        self.reset()
        sm.current = "home"

    root = Builder.load_string(r'''
        ScrollView:
            Label:
                text: 'Scrollview Example' * 100
                font_size: 30
                size_hint_x:1.0
                size_hint_y: None
                text_size: size.width, None
                height: self.texture_size[1]
                ''')
    runTouchApp(root)


class CameraWindow(Screen):
    def build(self):
        layout = BoxLayout(orientation = 'vertical')
        self.cameraObject = Camera(play = False)
        self.cameraObject.play = True
        self.cameraObject.resolution = (360, 360)
        self.camaraClick = Button(text="Take Photo")
        self.camaraClick.size_hint = (.5, .2)
        self.camaraClick.pos_hint = {'x': .25, 'y': .75}
        self.camaraClick.bind(on_press=self.onCameraClick)
        layout.add_widget(self.cameraObject)
        layout.add_widget(self.camaraClick)
        # return the root widget
        return layout
    def onCameraClick(self, *args):
        self.cameraObject.export_to_png('/kivyexamples/selfie.png')

class WindowManager(ScreenManager):
    pass


kv = Builder.load_file("cleanTrash.kv")
sm = WindowManager()

screens = [HomeWindow(name="home"), BadgeWindow(name="badge")]
for screen in screens:
    sm.add_widget(screen)

sm.current = "home"

class CleanTrashApp(App):
    def build(self):
        return sm

if __name__ == "__main__":
    CleanTrashApp().run()