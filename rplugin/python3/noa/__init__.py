import pynvim
import random
import websocket

@pynvim.plugin
class Noa(object):

    def __init__(self, nvim):
        websocket.enableTrace(True)
        self.nvim = nvim
        self.ws = websocket.create_connection("ws://localhost:5000/ws")

    def __del__(self):
        self.ws.close()

    @pynvim.function('NoaWSRECV', sync = False)
    def NoaWSRECV(self, args):
        self.nvim.call("noa#InitClient")
        while True:
            result = self.ws.recv()
            self.nvim.call("noa#insertText", result)

    @pynvim.function('NoaTestFunction', sync=False)
    def NoaTestFunc(self, args):
        if (len(args) > 0):
            argsIndex = random.randrange(len(args) - 1)
            self.nvim.command('echo "Test {}!!"'.format(args[argsIndex]))
        else :
            self.nvim.command('echo "Nothing args"')

    @pynvim.command('NoaTestCommand', nargs = '*')
    def NoaTestCmd(self, args):
        if (len(args) > 0):
            argsIndex = random.randrange(len(args) - 1)
            self.nvim.command('echo "Test {}!!"'.format(args[argsIndex]))
        else :
            self.nvim.command('echo "Nothing args"')

