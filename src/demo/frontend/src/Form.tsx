import { Alert, Box, Button, CircularProgress, Snackbar, TextField } from "@mui/material";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import { useMutation, useQueryClient } from "@tanstack/react-query";
import dayjs from "dayjs";
import { useState } from "react";

function Form () {

    const [description, setDescription] = useState<string>('')
    const [dueDate, setDueDate] = useState<string>('')

    const queryClient = useQueryClient();

    const mutation = useMutation({
        mutationFn: (newTodo: {description: string, dueDate: string}) => fetch('http://localhost:8080/Todos', {
            method: 'POST',
            body: JSON.stringify(newTodo),
            headers: new Headers({
                'Content-Type':  'application/json',
                'Accept': 'application/json'
            })
        }),
        onSuccess: () => {
            queryClient.invalidateQueries({queryKey: ['todoData']})
            setDescription('');
            setDueDate('')
        }
    })

    const createTodo = () => {
        const todo = { description, dueDate }
        mutation.mutate(todo)
    }

    return (
        <>
            <Snackbar open={mutation.isError} autoHideDuration={30}>
                <Alert severity='error' variant='filled' sx={{width: '100%'}}>An error has ocurred while trying to create Todo.</Alert>
            </Snackbar>
            <Snackbar open={mutation.isSuccess} autoHideDuration={15}>
                <Alert severity='success' variant='filled' sx={{width: '100%'}}>Todo created.</Alert>
            </Snackbar>
            <Box sx={{margin: '30px 0px', display: 'flex', gap: 2}}>
                <LocalizationProvider dateAdapter={AdapterDayjs}>
                <TextField variant='outlined' placeholder='What`s your task' sx={{flex: 5}} disabled={mutation.isPending} value={description} onChange={event => setDescription(event.target.value)} />
                <DatePicker disabled={mutation.isPending} value={dayjs(dueDate)} onChange={value => value ? setDueDate(value.format() ) : null} />
                <Button color='primary' variant='contained' size='large' disabled={mutation.isPending} onClick={createTodo}>
                    {mutation.isPending? <CircularProgress /> : 'Criar'}
                </Button>
                </LocalizationProvider>
            </Box>
        </>
    );
}

export default Form