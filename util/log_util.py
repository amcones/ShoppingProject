import logging


class Logger(object):
    def __init__(self):
        self.log = logging.getLogger('logs')
        self.log.setLevel(logging.INFO)
        self.formatter = logging.Formatter("%(asctime)s %(name)s %(levelname)s %(message)s")
        self.sh = logging.StreamHandler()
        self.sh.setLevel(logging.INFO)
        self.sh.setFormatter(self.formatter)
        self.fh = logging.FileHandler(filename="logs.log")
        self.fh.setLevel(logging.INFO)
        self.fh.setFormatter(self.formatter)
        self.log.addHandler(self.sh)
        self.log.addHandler(self.fh)

    def getLog(self):
        return self.log

