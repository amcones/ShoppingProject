from PySide6.QtCore import QObject, Slot, Signal
from dao.check_login import check_login


class LoginBackend(QObject):
    def __init__(self):
        QObject.__init__(self)

    err = Signal(str)
    success = Signal(str, bool)

    @Slot(str, str)
    def checkLogin(self, account, password):
        result = check_login(account, password)
        if result == -1:
            self.err.emit("用户不存在")
        elif result == 0:
            self.err.emit("账号或密码错误")
        else:
            self.success.emit(result[0], result[1])
