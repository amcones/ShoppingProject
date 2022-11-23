import base64
from util.log_util import Logger

logger = Logger()



def img_encoder(path):
    try:
        with open(path, 'rb') as f:
            image = f.read()
            image_base64 = str(base64.b64encode(image), encoding='utf-8')
            return image_base64
    except Exception as e:
        logger.log.error(e)


def img_decoder(image_base64):
    data = base64.b64decode(image_base64)
    return data
