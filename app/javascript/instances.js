import DefaultView from './instances/default-view';
import ReviewView from './instances/review-view';

export const AppInstance = {
  el: '#app',
  component: DefaultView,
}

export const ReviewInstance = {
  el: '#review',
  component: ReviewView,
}
