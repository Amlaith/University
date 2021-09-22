import pygame
import random


class Tetromino:
    """Класс фигур"""
    types = ('I', 'O', 'T', 'S', 'Z', 'J', 'L')

    # Положение фигуры в абстрактном квадрате:
    # 0  1  2  3
    # 4  5  6  7
    # 8  9  10 11
    # 12 13 14 15

    figures = {
        'I': [[4, 5, 6, 7], [2, 6, 10, 14], [8, 9, 10, 11], [1, 5, 9, 13]],
        'Z': [[0, 1, 5, 6], [2, 6, 5, 9], [4, 5, 9, 10], [1, 5, 4, 8]],
        'S': [[1, 2, 4, 5], [1, 5, 6, 10], [5, 6, 8, 9], [0, 4, 5, 9]],
        'J': [[0, 4, 5, 6], [1, 2, 5, 9], [4, 5, 6, 10], [1, 5, 9, 8]],
        'L': [[2, 4, 5, 6], [1, 5, 9, 10], [4, 5, 6, 8], [0, 1, 5, 9]],
        'T': [[1, 4, 5, 6], [1, 5, 6, 9], [4, 5, 6, 9], [1, 4, 5, 9]],
        'O': [[1, 2, 5, 6]],
    }

    # Цвета фигур
    colors = {
        'I': (0, 255, 255),
        'J': (0, 0, 255),
        'Z': (255, 0, 0),
        'S': (0, 255, 0),
        'L': (255, 127, 0),
        'T': (255, 0, 255),
        'O': (255, 255, 0),
    }

    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.type = random.choice(self.types)
        self.color = self.colors[self.type]
        self.rotation = 0

    def image(self):
        # Возвращает текущую позицию фигуры
        return self.figures[self.type][self.rotation]

    def rotate(self):
        # Поворачивает фигуру
        self.rotation = (self.rotation + 1) % len(self.figures[self.type])


class Tetris:
    """Класс игрового поля"""
    level = 2
    score = 0
    state = "start"
    field = []
    height = 0
    width = 0
    x = 100
    y = 20
    zoom = 20
    figure = None

    def __init__(self, height, width):
        self.height = height
        self.width = width
        self.field = [[0 for _ in range(width)] for _ in range(height)]
        self.score = 0
        self.state = "start"

    def new_figure(self):
        # Создается новый экземпляр фигуры
        self.figure = Tetromino(3, 0)

    def intersects(self):
        # Проверяются возможные пересечения текущей фигуры и других фигур или поля
        intersection = False
        for i in range(4):
            for j in range(4):
                if i * 4 + j in self.figure.image():
                    if i + self.figure.y > self.height - 1 or \
                            j + self.figure.x > self.width - 1 or \
                            j + self.figure.x < 0 or \
                            self.field[i + self.figure.y][j + self.figure.x] != 0:
                        intersection = True
        return intersection

    def break_lines(self):
        # Если линия поля целиком заполнена, линии сверху спускаются на ее место
        lines = 0
        for i in range(1, self.height):
            zeros = 0
            for j in range(self.width):
                if self.field[i][j] == 0:
                    zeros += 1
            if zeros == 0:
                lines += 1
                for i1 in range(i, 1, -1):
                    for j in range(self.width):
                        self.field[i1][j] = self.field[i1 - 1][j]
        self.score += lines ** 2

    def go_space(self):
        # По нажатию фигура спускается до самого нижнего возможного положения за один кадр
        while not self.intersects():
            self.figure.y += 1
        self.figure.y -= 1
        self.freeze()

    def go_down(self):
        # Фигура каждый кадр спускается на одну клетку
        self.figure.y += 1
        if self.intersects():
            self.figure.y -= 1
            self.freeze()

    def freeze(self):
        # Когда фигура доходит до нижнего положения, она сливается с другими, лежащими там,
        # Создается новая фигура
        # Если новая фигура сразу пересекаетс с предыдущими, игра заканчивается
        for i in range(4):
            for j in range(4):
                if i * 4 + j in self.figure.image():
                    self.field[i + self.figure.y][j + self.figure.x] = (127, 127, 127) #self.figure.color
        self.break_lines()
        self.new_figure()
        # if self.intersects():
        #     self.state = "gameover"
        for tile in self.field[0]:
            if tile is not 0:
                self.state = "gameover"

    def go_side(self, dx):
        # По нажатию фигура сдвигается на одну клетку вправо или влево
        old_x = self.figure.x
        self.figure.x += dx
        if self.intersects():
            self.figure.x = old_x

    def rotate(self):
        # По нажатию фигура поворачивается вокруг своей оси
        old_rotation = self.figure.rotation
        self.figure.rotate()
        if self.intersects():
            self.figure.rotation = old_rotation


# Запуск pygame
pygame.init()

# Некоторые часто используемые цвета
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
GRAY = (128, 128, 128)
BACKGROUND = (30, 30, 30)

# Окно игры
size = (400, 500)
screen = pygame.display.set_mode(size)
pygame.display.set_caption("Tetris")

# Цикл игры
done = False
clock = pygame.time.Clock()
fps = 20
tetris = Tetris(20, 10)
counter = 0

pressing_down = False
slide = 0
handled = 1

while not done:
    # Если фигуры нет - она создается
    if tetris.figure is None:
        tetris.new_figure()
    counter += 1
    if counter > 100000:
        counter = 0

    # Каждые несколько кадров текущая фигура спускается на клетку вниз
    if counter % (fps // tetris.level // 2) == 0 or pressing_down:
        if tetris.state == "start":
            tetris.go_down()

    # Обработка нажатых клавиш
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_UP:
                tetris.rotate()
            if event.key == pygame.K_DOWN:
                pressing_down = True
            if event.key == pygame.K_LEFT:
                slide = -1
                handled = 0
            if event.key == pygame.K_RIGHT:
                slide = 1
                handled = 0
            if event.key == pygame.K_SPACE:
                tetris.go_space()
            if event.key == pygame.K_r:
                tetris.__init__(20, 10)

    if counter % (fps // 10 ) == 0:
        tetris.go_side(slide)
        handled = 1

    if event.type == pygame.KEYUP:
        if handled == 0:
            tetris.go_side(slide)
            handled = 1
        if event.key == pygame.K_DOWN:
            pressing_down = False
        if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
            slide = 0

    # Заливка фона
    screen.fill(BACKGROUND)

    # Отрисовка лежащих фигур
    for i in range(0, tetris.height):
        for j in range(tetris.width):
            if tetris.field[i][j] != 0:
                pygame.draw.rect(screen, tetris.field[i][j],
                                 [tetris.x + tetris.zoom * j + 1, tetris.y + 40 + tetris.zoom * i + 1, tetris.zoom - 2, tetris.zoom - 1])

    # Отрисовка текущего положения фигуры
    if tetris.figure is not None:
        for i in range(4):
            for j in range(4):
                p = i * 4 + j
                if p in tetris.figure.image():
                    pygame.draw.rect(screen, tetris.figure.color,
                                     [tetris.x + tetris.zoom * (j + tetris.figure.x) + 1,
                                      tetris.y + tetris.zoom * (i + tetris.figure.y) + 1,
                                      tetris.zoom - 2, tetris.zoom - 2])

    # Отрисовка клеток поля
    for i, line in enumerate(tetris.field):
        for j, tile in enumerate(line):
            pygame.draw.rect(screen, (113, 33, 254), [tetris.x + tetris.zoom * j, tetris.y + tetris.zoom * (i + 2), tetris.zoom, tetris.zoom], 1)

    # Надпись окончания игры
    font = pygame.font.SysFont('Calibri', 25, True, False)
    font1 = pygame.font.SysFont('Calibri', 65, True, False)
    text = font.render("Score: " + str(tetris.score), True, WHITE)
    text_game_over = font1.render("Game Over", True, (255, 125, 0))
    text_game_over1 = font1.render("Press 'R'", True, (255, 215, 0))
    text_game_over2 = font1.render("to restart", True, (255, 215, 0))

    screen.blit(text, [0, 0])
    if tetris.state == "gameover":
        screen.blit(text_game_over, [43, 200])
        screen.blit(text_game_over1, [88, 265])
        screen.blit(text_game_over2, [72, 330])

    # Фигуры появляются на две клетки выше, нужен прямоугольник цвета фона,
    # который их закроет
    pygame.draw.rect(screen, (BACKGROUND),
                     [tetris.x, tetris.y, tetris.zoom * 10, tetris.zoom * 2])

    # Обновление монитора
    pygame.display.flip()
    # Тик кадра
    clock.tick(fps)

# Выход из pygame после закрытия окна
pygame.quit()
