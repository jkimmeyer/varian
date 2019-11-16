import DefaultView from './instances/default-view';
import ReviewView from './instances/review-view';
import ReportView from './instances/report-view';

export const AppInstance = {
  el: '#app',
  component: DefaultView,
}

export const ReviewInstance = {
  el: '#review',
  component: ReviewView,
}

export const ReportInstance = {
  el: '#report',
  component: ReportView,
}
