import React, { Fragment } from 'react';
import { Columns, Button } from 'react-bulma-components';
import styled from 'styled-components';
import Music from './music';

const PlaySequenceButton = styled(Button)`
  margin-bottom: 30px;
`;

const Musics = ({ songs, artist_name } = props) => {
  const songs_components = songs.map((song, key) => (
    <Columns.Column desktop={{ size: 6 }} mobile={{ size: 12 }} key={key}>
      <Music song={song} artist_name={artist_name} />
    </Columns.Column>
  ));

  return (
    <Fragment>
      <Columns className='is-mobile is-centered'>
        <Columns.Column
          desktop={{ size: 2 }}
          mobile={{ size: 12 }}
          className='has-text-centered'
        >
          <PlaySequenceButton className='is-medium' color='primary' outlined>
            Tocar em sequência
          </PlaySequenceButton>
        </Columns.Column>
      </Columns>
      {songs_components.length > 0 && (
        <Columns className='is-mobile'>{songs_components}</Columns>
      )}
    </Fragment>
  );
};

export default Musics;
