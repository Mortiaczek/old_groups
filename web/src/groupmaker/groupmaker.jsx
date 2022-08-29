import React, { Component } from "react";
import "./groupmaker.css";
import { TextField, Button } from '@mui/material';
import { alpha, styled } from '@mui/material/styles';
import AddIcon from '@mui/icons-material/Add';
import {debugData} from "../utils/debugData";
import { fetchNui } from "../utils/fetchNui";

debugData([
    {
      action: 'setVisible',
      data: true,
    }
])

const RedditTextField = styled((props) => (
  <TextField InputProps={{ disableUnderline: true }} {...props} />
))(({ theme }) => ({
  '& .MuiFilledInput-root': {
    border: '1px solid #656e7d',
    overflow: 'hidden',
    borderRadius: 4,
    backgroundColor: 'transparent',
    color: 'white',
    '&:hover': {
      backgroundColor: 'transparent',
    },
    '&.Mui-focused': {
      backgroundColor: 'transparent',
      boxShadow: `${alpha(theme.palette.primary.main, 0.25)} 0 0 0 2px`,
      borderColor: theme.palette.primary.main,
    },
  },
  '& label': {
    color: 'white',
    fontSize: '0.9vw'
  },
}));

class groupApp extends Component {
    state = {
        group: []
    }
    render() {
        const { group } = this.state;
        return (
            <>
                <div className="container">
                    <div className="menu">
                    <p>Tworzenie grupy</p>
                    <RedditTextField
                        label="Nazwa skryptowa"
                        id="name-input"
                        variant="filled"
                        style={{ marginTop: 11, width: '60%', height: '14%' }}
                        value = {group.name}
                        onChange={(e) => {
                            group.name = e.target.value
                        }}
                    />
                    <RedditTextField
                        label="Pełna nazwa"
                        id="fullname-input"
                        variant="filled"
                        style={{ marginTop: 11, width: '60%', height: '14%' }}
                        value = {group.fullname}
                        onChange={(e) => {
                            group.fullname = e.target.value
                        }}
                    />
                    <RedditTextField
                        label="Skrót"
                        id="shortname-input"
                        variant="filled"
                        style={{ marginTop: 11, width: '60%', height: '14%' }}
                        value = {group.shortname}
                        onChange={(e) => {
                            group.shortname = e.target.value
                        }}
                    />
                    <Button 
                        variant="contained" 
                        endIcon={<AddIcon />}
                        onClick={() => {
                            fetchNui("createGroup", {
                              name: group.name,
                              fullname: group.fullname,
                              shortname: group.shortname
                            });
                          }}
                        style={{ marginTop: 11,  backgroundColor: '#656e7d', width: '60%', borderRadius: 4, fontSize: '0.8vw', height: '10%' }}
                    >
                        Utwórz
                    </Button>
                    </div>
                </div>
            </>
        );
    }
};

export default groupApp;