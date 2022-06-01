# @version >=0.3.2

# @notice Structs are custom defined types that can group several variables

# @var defining a struct that groups a string variable and a boolean variable
struct Todo:
    text: String[100]
    completed: bool

# @var An array of Todo structs
todos: public(DynArray[Todo, 10])

# @notice Declaring a struct variable and adding it to the array
@external
def createTodo(_text: String[100]):
    exampleTodo: Todo = Todo({text: _text, completed: False})
    self.todos.append(exampleTodo)

@external
@view
def get(_index: uint256) -> Todo:
    getTodo: Todo = self.todos[_index]
    return(getTodo)

# @notice Updating the text in a struct variable
@external
def updateText(_index: uint256, _text: String[100]):
    self.todos[_index].text = _text

# @notice Updating the text in a struct variable
@external
def toggleCompleted(_index: uint256):
    self.todos[_index].completed = True
