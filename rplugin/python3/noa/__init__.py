import neovim
import random
import websocket

@neovim.plugin
class Noa(object):

    def __init__(self, nvim):
        websocket.enableTrace(True)
        self.nvim = nvim
        self.ws = websocket.create_connection("ws://localhost:5000/ws")

    def __del__(self):
        self.ws.close()

    @neovim.command('NoaSend', nargs = '*')
    def NoaWSSend(self, args):
        if (len(args) > 0):
            self.ws.send(args[0])
            result = self.ws.recv()
            self.nvim.command('echo "%s"' % result)

    @neovim.function('NoaWSRECV', sync = False)
    def NoaWSRECV(self, args):
        while True:
            result = self.ws.recv()
            self.nvim.command('echo "%s"' % result)

    @neovim.function('NoaTestFunction', sync=False)
    def NoaTestFunc(self, args):
        if (len(args) > 0):
            argsIndex = random.randrange(len(args) - 1)
            self.nvim.command('echo "Test {}!!"'.format(args[argsIndex]))
        else :
            self.nvim.command('echo "Nothing args"')

    @neovim.command('NoaTestCommand', nargs = '*')
    def NoaTestCmd(self, args):
        if (len(args) > 0):
            argsIndex = random.randrange(len(args) - 1)
            self.nvim.command('echo "Test {}!!"'.format(args[argsIndex]))
        else :
            self.nvim.command('echo "Nothing args"')

