export function fetchQuestions(count) {
    return fetch(`http://localhost:8000/api/questions?count=${count}`)
        .then(response => response.json());
}