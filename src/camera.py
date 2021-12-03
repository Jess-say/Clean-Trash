from kivy.app import App
from kivy.core.window import Window
from kivy.uix.button import Button
from kivy.uix.camera import Camera
from kivy.uix.gridlayout import GridLayout
from kivy.uix.boxlayout import BoxLayout
import time

# set window size
window_width = 500
window_height = 550
Window.size = (window_width, window_height)

class cameraApp(App):
    def build(self):
        layout = BoxLayout(orientation='vertical')
        
        # Create a camera object
        self.cameraObject = Camera(resolution=(window_width*2, window_height*3))

        # Create camera button 
        btn = Button(text="Take Photo")
        btn.size_hint = (.5, .2)
        btn.pos_hint={'x': .25, 'y':.75}
        btn.font_size = 35
        self.camaraClick = btn

        # bind button's on_press to onCameraClick
        self.camaraClick.bind(on_press = self.captureImage)

        # add camera & button to layout
        layout.add_widget(self.cameraObject)
        layout.add_widget(self.camaraClick)

        # return root widget
        return layout  

    def captureImage(self, *args):
        '''
        save captured image and name png with date and time
         of when the image was captured
        '''
        timestr = time.strftime("%Y%m%d_%H%M%S")
        self.cameraObject.export_to_png('image' + timestr + '.png')
        print('Image captured')

if __name__ == '__main__':
    # run app
    cameraApp().run()