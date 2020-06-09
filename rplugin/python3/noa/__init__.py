import neovim
import random

@neovim.plugin
class Noa(object):

    def __init__(self, nvim):
        self.nvim = nvim

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

