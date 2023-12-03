function createUser(username, age) {
  return {
    type: CREATE_USER,
    data: {
      username: username,
      age: age,
    },
  };
}

function createUserSuccess(id) {
	return {
    type: CREATE_USER_SUCCESS,
    payload: {
    	user: id
    },
  }
}

function createUserError(error) {
	return {
    type: CREATE_USER_FAILURE,
    payload: error,
  }
}

function createUser(username, age) {
	fetch.post()
	.then((id) -> store.dispatch(createUserSuccess(id)))
	.catch((err) -> store.dispatch(createUserError(err)))
}
