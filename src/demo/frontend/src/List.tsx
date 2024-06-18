import { Checkbox, List as MList, ListItem, ListItemText, Typography, CircularProgress, Snackbar, Alert } from '@mui/material'
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'

function List () {

    const queryClient = useQueryClient();

    const query = useQuery({
        queryKey: ['todoData'],
        queryFn: () => fetch('http://localhost:8080/Todos').then(res => res.json())
    })

    const mutation = useMutation({
        mutationFn: (patchingTodo) => fetch(`http://localhost:8080/Todos/${patchingTodo.id}`, {
            method: 'PATCH',
            body: JSON.stringify({completed: patchingTodo.completed}),
            headers: new Headers({
                'Content-Type':  'application/json',
                'Accept': 'application/json'
            })
        }),
        onSuccess: () => {
            queryClient.invalidateQueries({queryKey: ['todoData']})
        }
    })

    const completeTodo = (id: number) => {
        const patchingTodo = {id, completed: true}
        mutation.mutate(patchingTodo)
    }

    if (query.isPending) return (<CircularProgress />)

    return (
        <>
            <Snackbar open={query.isError} autoHideDuration={30}>
                <Alert severity='error' variant='filled' sx={{width: '100%'}}>An error has ocurred while trying to get Todos.</Alert>
            </Snackbar>
            <MList>
                {query.data.map((todo:{id: number, description: string, dueDate?: string, completed: boolean}) => 
                <ListItem key={todo.id} secondaryAction={
                    <Checkbox edge='end' checked={todo.completed} onChange={() => completeTodo(todo.id)} />
                }>
                    <ListItemText primary={todo.description} secondary={ 
                    <Typography sx={{display: 'inline'}} component='span' variant='body2'>{todo.dueDate}</Typography>
                    }>
                    </ListItemText>
                </ListItem>
                )}
            </MList>
        </>
    )
}

export default List
