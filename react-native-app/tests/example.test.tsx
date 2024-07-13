import React from 'react';
import renderer from 'react-test-renderer';
import ExampleIntroComponent from '../components/ExampleIntroComponent';

test('renders correctly', () => {
  const tree = renderer.create(<ExampleIntroComponent />).toJSON();
  expect(tree).toMatchSnapshot();
});