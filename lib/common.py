def print_title(s: str, w: int = 50, f:str = '*'):
    n = w-4
    print(f * w)
    print(s)
    print(f * w)

def task(name):
    def wrapper2(f):
        def wrapper(*args, **kwargs):
            print_title(f'Start Of Task #{name}')
            f(*args, **kwargs)
            print_title(f'End Of Task #{name}')
            
        return wrapper

    return wrapper2