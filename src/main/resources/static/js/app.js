window.addEventListener('load', () =>{
    if ('serviceWorker' in navigator){
        navigator.serviceWorker.register('./sw.js')
            .then(registration => {
                console.log('Success registration', registration);
            })
            .catch(error => {
                console.log('Failed registration', error);
            });
    }
});